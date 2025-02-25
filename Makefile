
# Compiler settings
CXX := g++
CXXFLAGS := -std=c++11 -Wall -Wextra -Iinclude
SRCDIR := src
BUILD_DIR := build
SOURCES := $(wildcard $(SRCDIR)/**/*.cpp) $(wildcard $(SRCDIR)/*.cpp)
OBJS := $(patsubst $(SRCDIR)/%.cpp, $(BUILD_DIR)/%.o, $(SOURCES))
LDFLAGS := -std=c++11 -lraylib -lm

# Platform-specific settings
OS := $(shell uname)

ifeq ($(OS), Darwin)  # macOS
    TARGET := game-macos
    LDFLAGS += -framework OpenGL -framework Cocoa -framework IOKit -framework CoreVideo
else ifeq ($(OS), Linux)  # Linux
    TARGET := game-linux
    LDFLAGS += -lGL -lGLU -lX11
else
    TARGET := game  # Default
endif

# Windows compilation
WINDOWS_CXX := x86_64-w64-mingw32-g++
WINDOWS_LDFLAGS := -lraylib -lopengl32 -lgdi32 -lwinmm
WINDOWS_TARGET := game.exe

# Rules
all: linux  # Default to Linux

$(BUILD_DIR)/%.o: $(SRCDIR)/%.cpp
	@mkdir -p $(@D)
	$(CXX) $(CXXFLAGS) -c $< -o $@

linux: $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET) $(LDFLAGS)

macos: $(OBJS)
	$(CXX) $(CXXFLAGS) $(OBJS) -o $(TARGET) $(LDFLAGS)

windows: $(OBJS)
	$(WINDOWS_CXX) $(CXXFLAGS) $(OBJS) -o $(WINDOWS_TARGET) $(WINDOWS_LDFLAGS)

clean:
	rm -rf $(BUILD_DIR) $(TARGET) $(WINDOWS_TARGET)

.PHONY: all linux macos windows clean
