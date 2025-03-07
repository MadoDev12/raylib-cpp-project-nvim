#include <raylib.h>

int main(){
    InitWindow(1280,720,"do i look?");

    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);
            DrawCircle(1280/2, 720/2, 20, BLACK);
        EndDrawing();
    }

    CloseWindow();
    return 0;
}
