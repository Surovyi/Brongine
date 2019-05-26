#pragma once

namespace Brongine
{
	class Application
	{
	public:
		Application();
		virtual ~Application();

		void Run();


	private:
		bool m_IsRunning = true;

	};

	Application* CreateApplication();
}