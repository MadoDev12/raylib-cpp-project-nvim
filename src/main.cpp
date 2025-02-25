#include "raylib.h"

int main(){
    InitWindow(1280,720,"do i look?");

    while (!WindowShouldClose()) {
        BeginDrawing();
        ClearBackground(RAYWHITE);

        EndDrawing();
    }

    CloseWindow();
    return 0;
}