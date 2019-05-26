#pragma once

#ifdef BRO_PLATFORM_WINDOWS

extern Brongine::Application* Brongine::CreateApplication();


int main(int* argc, char** argv)
{
	auto game = Brongine::CreateApplication();

	game->Run();

	delete game;
	return 0;
}
#endif // BRO_PLATFORM_WINDOWS