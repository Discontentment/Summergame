# Makefile for raylib project

# Define compiler (g++ for C++, gcc for C)
CXX = g++
CC = gcc

# Choose your language
LANG = C # or CXX

ifeq ($(LANG), CXX)
    COMPILER = $(CXX)
    SOURCE_FILE = src/main.cpp
    STD_FLAG = -std=c++17
else
    COMPILER = $(CC)
    SOURCE_FILE = src/main.c
    STD_FLAG = -std=c99
endif

# Project name
PROJECT_NAME = Summergame

# Path to raylib installation (ADJUST THIS)
RAYLIB_PATH = C:/raylib # Example for Windows, use /path/to/raylib for Linux/macOS

# Compiler flags
CFLAGS = $(STD_FLAG) -Wall -Wextra -g -I$(RAYLIB_PATH)/include

# Linker flags
LDFLAGS = -L$(RAYLIB_PATH)/lib -lraylib -lopengl32 -lgdi32 -lwinmm

# Main target
all: $(PROJECT_NAME)

$(PROJECT_NAME): $(SOURCE_FILE)
    $(COMPILER) $(SOURCE_FILE) -o $@ $(CFLAGS) $(LDFLAGS)

# Run target
run: $(PROJECT_NAME)
    ./$(PROJECT_NAME)

# Clean target
clean:
    rm -f $(PROJECT_NAME)