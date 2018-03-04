local discordia = require('discordia')
local client = discordia.Client()

client:on('ready', function()
	print('[BOT] Im Logged in as '.. client.user.username)
	print(client:getChannel())
	client:setGame('Бот великий')
end)

--Новый пользователь вошёл в чат

client:on('messageCreate', function(message)
	--local cmd, arg = string.match(message.content, '(%S+) (.*)')
	local cmd = string.match(message.content, '(%Бот, шанс того, что)')
	local err = string.match(message.content, '(%Бот,)')
	local arg = string.match(message.content, '[^Бот, шанс того, что]')
	cmd = cmd or message.content
	if message.content == 'Бот, как у тебя дела?' or message.content == 'Бот, как дела?' then
		message.channel:send('Спасибо, '..message.author.mentionString..', Отлично! А ты как?')
	end
	if message.content == '!link' then
		message.channel:send('Ссылка на наш сервер: https://discord.gg/3P3pUKX')
	end
	if cmd == 'Бот, шанс того, что' then
		if arg then
			message.channel:send(message.author.mentionString..' Шанс в данной ситуации равен: '..math.random(1,100)..'%')
		else
			message.channel:send(message.author.mentionString..' Шанс того, что ты забыл указать аргумент - 100%')
		end
	end
end)

client:run('Bot NDE5Nzk2Nzk0MzE1MTEyNDQ4.DX1V4g.bKK0DlSF40xrNXaU5Lnm2ns-E9U')