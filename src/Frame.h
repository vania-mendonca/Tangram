#pragma once

#include "Entity.h"

#include <iostream>

class Frame : public Entity {
	private:

	public:
		Frame(std::string id);
		void update();
		void updateShader();
};