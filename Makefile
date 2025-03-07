UNAME_S := $(shell uname -s)

# Compiler
CXX = g++

# Source Files
SRC = src/main.cpp

# Output Binary
OUT = bin/template

# Default Raylib Path
RAYLIB_INCLUDE = -I$(HOME)/raylib/src
RAYLIB_LIB = -L$(HOME)/raylib/src -lraylib

# Compiler Flags
CXXFLAGS = -Wall -std=c++17 $(RAYLIB_INCLUDE)
LDFLAGS = $(RAYLIB_LIB)

# Platform-specific settings
ifeq ($(UNAME_S), Linux)
    LDFLAGS += -lGL -lm -lpthread -ldl -lrt -lX11
endif

ifeq ($(UNAME_S), Darwin)  # macOS
    LDFLAGS += -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo
endif

ifeq ($(OS), Windows_NT)  # Windows
    RAYLIB_LIB = -L$(HOME)/raylib/src -lraylib -lopengl32 -lgdi32 -lwinmm
endif

# Build
all:
	$(CXX) $(CXXFLAGS) $(SRC) -o $(OUT) $(LDFLAGS)

# Clean
clean:
	rm -f $(OUT)

