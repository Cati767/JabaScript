#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

#define MAX_MEM 30000

void print_help() {
    printf("--- JabaScript Commands ---\n");
    printf("spawn: +1 | die: -1 | leap: -> | retreat: <- | croak: print char | observe: input | drown: 0 | tadpole: +10 | bullfrog: ->5 | lilypad: space | ribbit: print num | metamorphosis: *2 | hibernation: /2 | camouflage: invert | migrate: reset | predator: rand jump | swamp_gas: rand val | reproduce: copy to next | sunbathe: +50 | render: show pond | summon: call file | gimme-pad: help | burrow: exit\n");
    printf("Usage: jaba [file.jaba] or jaba gimme-pad\n");
}

void render(unsigned char *pond, unsigned char *frog) {
    printf("\033[H\033[J");
    for (int i = 0; i < 100; i++) {
        if (&pond[i] == frog) printf("[F]");
        else if (pond[i] > 0) printf(" ~ ");
        else printf(" . ");
        if ((i + 1) % 10 == 0) printf("\n");
    }
}

void execute(char *filename, unsigned char *pond) {
    FILE *f = fopen(filename, "r");
    if (!f) {
        printf("Error: Could not open file '%s'.\n", filename);
        return;
    }
    unsigned char *frog = pond;
    char buffer[32];
    while (fscanf(f, "%s", buffer) != EOF) {
        if (strcmp(buffer, "spawn") == 0) (*frog)++;
        else if (strcmp(buffer, "die") == 0) (*frog)--;
        else if (strcmp(buffer, "leap") == 0) frog++;
        else if (strcmp(buffer, "retreat") == 0) frog--;
        else if (strcmp(buffer, "croak") == 0) putchar(*frog);
        else if (strcmp(buffer, "observe") == 0) (*frog) = getchar();
        else if (strcmp(buffer, "drown") == 0) (*frog) = 0;
        else if (strcmp(buffer, "tadpole") == 0) (*frog) += 10;
        else if (strcmp(buffer, "bullfrog") == 0) frog += 5;
        else if (strcmp(buffer, "lilypad") == 0) (*frog) = 32;
        else if (strcmp(buffer, "ribbit") == 0) printf("%d", *frog);
        else if (strcmp(buffer, "metamorphosis") == 0) (*frog) *= 2;
        else if (strcmp(buffer, "hibernation") == 0) (*frog) /= 2;
        else if (strcmp(buffer, "camouflage") == 0) (*frog) = 255 - (*frog);
        else if (strcmp(buffer, "migrate") == 0) frog = pond;
        else if (strcmp(buffer, "predator") == 0) frog = (pond + (rand() % MAX_MEM));
        else if (strcmp(buffer, "swamp_gas") == 0) (*frog) = rand() % 256;
        else if (strcmp(buffer, "reproduce") == 0) *(frog + 1) = *frog;
        else if (strcmp(buffer, "sunbathe") == 0) (*frog) += 50;
        else if (strcmp(buffer, "render") == 0) render(pond, frog);
        else if (strcmp(buffer, "summon") == 0) {
            char lib[32];
            if(fscanf(f, "%s", lib) == 1) execute(lib, pond);
        }
        else if (strcmp(buffer, "burrow") == 0) break;
    }
    fclose(f);
}

int main(int argc, char *argv[]) {
    srand(time(NULL));
    if (argc == 2 && strcmp(argv[1], "gimme-pad") == 0) {
        print_help();
        return 0;
    }
    if (argc < 2) {
        printf("Usage: jaba [file.jaba]\nNeed help? Say \"jaba gimme-pad\"\n");
        return 1;
    }
    unsigned char *pond = calloc(MAX_MEM, sizeof(unsigned char));
    execute(argv[1], pond);
    free(pond);
    return 0;
}
