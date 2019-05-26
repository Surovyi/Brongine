#include "Brongine/Engine.h"
#include <iostream>


class Game : public Brongine::Application
{
public:
	Game() 
	{ 
		std::cout << "Hello World, my Game!" << std::endl; 
	}
	~Game() {}
};


Brongine::Application* Brongine::CreateApplication()
{
	return new Game();
}