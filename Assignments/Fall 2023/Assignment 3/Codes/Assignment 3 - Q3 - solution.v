// ماژول برای یافتن اولین '1' در ورودی 8 بیتی
module first_one(A, Y, NONE);

    // تعریف ورودی و خروجی‌ها
    input wire [7:0] A;       // ورودی 8 بیتی
    output reg [2:0] Y;       // خروجی 3 بیتی برای موقعیت اولین '1'
    output reg NONE;          // پرچم برای نشان دادن اینکه آیا '1' پیدا شده است یا نه

    integer i;                // متغیر حلقه

    // بلوک always که با تغییرات A فعال می‌شود
    always @(A) begin
        NONE = 1'b1;          // ابتدا فرض کنید که '1' پیدا نشده است

        // حلقه برای بررسی هر بیت از A از MSB شروع می‌شود
        for (i = 7; i >= 0; i = i - 1) begin
            if (A[i] == 1'b1) begin
                NONE <= 1'b0; // NONE را روی 0 قرار دهید اگر '1' پیدا شد
                Y <= i;       // موقعیت '1' را به Y اختصاص دهید
                disable block; // خروج از حلقه پس از یافتن '1'
            end
        end
    end

endmodule