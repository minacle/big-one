/*********************************************************************
 * Copyright (c) perillamint
 *
 * This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://www.wtfpl.net/ for more details.
 *********************************************************************/

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>

#ifdef DEBUGFLAG
#include <stdio.h>
#endif

#define BIGFILE "big"
#define MAXWRITECHUNK 1024

int main(int argc, char **argv)
{
  struct stat buf;
  int writechunk = MAXWRITECHUNK;
  int res;
  int fd;

  char *zeroblock = malloc(MAXWRITECHUNK);
  memset(zeroblock, 0, MAXWRITECHUNK);

  res = stat(BIGFILE, &buf);

  if(res == 0)
    {
      #ifdef DEBUGFLAG
      printf("EFILEEXIST\n");
      #endif
      exit(0);
    }

  fd = open(BIGFILE, O_WRONLY | O_CREAT, 0644);

  if(fd == -1)
    {
      #ifdef DEBUGFLAG
      printf("ECANNOTCREAT\n");
      #endif
      exit(0);
    }

  while(writechunk > 0)
    {
      res = write(fd, zeroblock, writechunk);

      if(res <= 0)
        {
          #ifdef DEBUGFLAG
          printf("Throttling down!\n");
          #endif
          writechunk /= 2;
        }
    }

  close(fd);
  free(zeroblock);
  return 0;
}
