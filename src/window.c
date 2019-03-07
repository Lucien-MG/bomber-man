#include <stdlib.h>
#include <stdio.h>
#include <err.h>
#include <SDL2/SDL.h>

SDL_Window* window_start() {

    if (SDL_Init(SDL_INIT_VIDEO) != 0)
    {
        errx(1,"Échec de l'initialisation de la SDL (%s)\n",SDL_GetError());
        return NULL;
    }

    SDL_Window* pWindow = NULL;

    pWindow = SDL_CreateWindow("Ma première application SDL2",
                                SDL_WINDOWPOS_UNDEFINED,
                                SDL_WINDOWPOS_UNDEFINED,
                                640,
                                480,
                                SDL_WINDOW_SHOWN
                            );

    return pWindow;
}

void window_close(SDL_Window* w) {
    SDL_DestroyWindow(w);
    SDL_Quit();
}