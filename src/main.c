#include <stdlib.h>
#include <stdio.h>
#include <SDL2/SDL.h>

#include "window.h"

int main() {

    SDL_Window* pWindow = window_start();

    if( pWindow )
    {
        SDL_Delay(3000); /* Attendre trois secondes, que l'utilisateur voie la fenêtre */
    }
    else
    {
        fprintf(stderr,"Erreur de création de la fenêtre: %s\n",SDL_GetError());
    }

    window_close(pWindow);    

    return 0;
}