"""! @brief Файл описывает наборы раскладок кнопок чат-бота"""
##
# @file keyboardlib.py
#
# @brief В файле описываются наборы раскладок кнопок чат-бота.
#
# @section client Описание
# Раскладки кнопок представляют собой методы получения обьекта VkKeyBoard
#
# @section libraries_main Libraries/Modules
# - vk_api library
# 

# Imports
from vk_api.keyboard import VkKeyboard, VkKeyboardColor

def create_keyboard_main_menu():
	"""!@brief метод получения набора кнопок для основного меню
	@return VkKeyboard основное меню
	"""
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("Вакансии", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("Организации", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("Сброс", color=VkKeyboardColor.PRIMARY)
	keyboard.add_button("?", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()

def create_keyboard_institut_setup():
	"""!@brief метод получения набора кнопок для выбора института из списка
	@return VkKeyboard все институты
	"""
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
	return keyboard.get_keyboard()

def create_keyboard_vakansii_manipulator():
	"""!@brief метод получения набора кнопок для переключения по спику вакансий
	@return VkKeyboard набор кнопок для переключения по спику вакансий
	"""
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("Следующая", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	#keyboard.add_button("Кнопка 1", color=VkKeyboardColor.PRIMARY)
	#keyboard.add_button("Кнопка 2", color=VkKeyboardColor.PRIMARY)
	#keyboard.add_line()
	keyboard.add_button("Главное меню", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()

def create_keyboard_start_setup():
	"""!@brief метод получения набора кнопок стартовое меню
	@return VkKeyboard набор кнопок стартовое меню
	"""
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("Отключить", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("Институты", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()

def create_keyboard_start_bot():
	"""!@brief метод получения набора кнопок запуск бота
	@return VkKeyboard набор кнопок запуск бота
	"""
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("start", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()

# Global Constants
## лист всех методов привязанных к индексу этого листа
key_boards = (create_keyboard_start_setup, create_keyboard_main_menu, create_keyboard_vakansii_manipulator, create_keyboard_institut_setup,create_keyboard_start_bot)