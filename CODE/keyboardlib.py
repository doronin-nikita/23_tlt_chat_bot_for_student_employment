from vk_api.keyboard import VkKeyboard, VkKeyboardColor

def create_keyboard_main_menu():
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("Вакансии", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("Организации", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("?", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()

def create_keyboard_institut_setup():
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("АСИ", color=VkKeyboardColor.PRIMARY)
	keyboard.add_button("ИМФиИТ", color=VkKeyboardColor.PRIMARY)
	keyboard.add_button("ИХиЭ", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("ИнМаш", color=VkKeyboardColor.PRIMARY)
	keyboard.add_button("ИФЭиУ", color=VkKeyboardColor.PRIMARY)
	keyboard.add_button("ГумПИ", color=VkKeyboardColor.PRIMARY)
	keyboard.add_button("ИФКиС", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("ИИиЭБ", color=VkKeyboardColor.PRIMARY)
	keyboard.add_button("ИИиДПИ", color=VkKeyboardColor.PRIMARY)
	keyboard.add_button("ИП", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("Главное меню", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()

def create_keyboard_vakansii_manipulator():
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("Следующая", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	#keyboard.add_button("Кнопка 1", color=VkKeyboardColor.PRIMARY)
	#keyboard.add_button("Кнопка 2", color=VkKeyboardColor.PRIMARY)
	#keyboard.add_line()
	keyboard.add_button("Главное меню", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()

key_boards = (create_keyboard_main_menu, create_keyboard_vakansii_manipulator, create_keyboard_institut_setup)