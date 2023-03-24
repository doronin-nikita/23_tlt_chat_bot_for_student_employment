from vk_api.keyboard import VkKeyboard, VkKeyboardColor
def create_keyboard():
	keyboard = VkKeyboard(one_time=False)
	keyboard.add_button("вакансии", color=VkKeyboardColor.PRIMARY)
	keyboard.add_line()
	keyboard.add_button("следующая", color=VkKeyboardColor.PRIMARY)
	return keyboard.get_keyboard()