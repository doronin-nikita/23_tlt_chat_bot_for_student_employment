from vk_api.keyboard import VkKeyboard, VkKeyboardColor
def create_keyboard():
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("вакансии", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("следующая", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()

def create_keyboard_inst():
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