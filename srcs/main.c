#include <SDL2/SDL.h>
#include <stdio.h>

int main(void)
{
    if(SDL_Init(SDL_INIT_EVERYTHING) < 0)
    {
        printf("Failed to initialize the SDL2 library\n");
        return (1);
    }

    SDL_Window *window = SDL_CreateWindow("SDL2 Window",
                                        SDL_WINDOWPOS_CENTERED,
                                        SDL_WINDOWPOS_CENTERED,
                                        680, 480,
                                        0);

    if(!window)
    {
        printf("Failed to create window\n");
        return (1);
    }

    SDL_Renderer *renderer = SDL_CreateRenderer(window, -1, 0);

    if(!renderer)
    {
       printf("Failed to get the surface from the window\n");
        return (1);
    }

    SDL_Delay(1000);

    SDL_DestroyRenderer(renderer);
    SDL_DestroyWindow(window);
    SDL_Quit();

    return (0);
}
