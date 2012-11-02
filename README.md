											Документация портала для коллежда.

Автор: Яковлев Артур.
Год: 2012.
Рекомендуемая ОС: Unix образная.


											Советы.

Наилучший поиск решения проблеммы - вы можете задать вопрос на Stack Overflow

Для понимания Ruby on Rails рекомендую прочесть это чтиво http://russian.railstutorial.org/chapters/beginning

Не забывайте гуглить свои проблемы

Соблюдайте нотацию которая описана в этой документации

											Как сгенерировать SSH ключь.

Если у вас уже есть ключь переходите к Шагу 4.

Шаг 1.

Для начала надо проверить наличие ключей на компьютере, для этого перейдите в терминал и выполните команды
	
	$ cd ~/.ssh# Checks to see if there is a directory named ".ssh" in your user directory
Если вы увидите сообщение подобное этому "No such file or directory" переходите к шагу 3, иначе к шагу 2.

Шаг 2. Backup and remove existing SSH keys

Не хочется переводить инструкцию на русский ввиду ее приметивности, поэтому уж постарайтесь понять о чем идет речь. 

	$ ls                      # Lists all the subdirectories in the current directory
	# config  id_rsa  id_rsa.pub  known_hosts

	$ mkdir key_backup        # Makes a subdirectory called "key_backup" in the current directory

	$ cp id_rsa* key_backup   # Copies the id_rsa keypair into key_backup

	$ rm id_rsa*              # Deletes the id_rsa keypair

Шаг 3. Generate a new SSH key

Для создания нового ключа выполните ниже приведенные инструкции.

	$ ssh-keygen -t rsa -C "your_email@youremail.com"# Creates a new ssh key using the provided email
	
	# Generating public/private rsa key pair.
	# Enter file in which to save the key (/home/you/.ssh/id_rsa):

	#Enter passphrase (empty for no passphrase): [Type a passphrase]
	# Enter same passphrase again: [Type passphrase again]

Далее вы увилите что-то похожее на это.

	#Your identification has been saved in /home/you/.ssh/id_rsa.
	# Your public key has been saved in /home/you/.ssh/id_rsa.pub.
	# The key fingerprint is:
	# 01:0f:f4:3b:ca:85:d6:17:a1:7d:f0:68:9d:f0:a2:db your_email@youremail.com

Шаг 4. Add your SSH key to GitHub and if u want to heroku.

Вам понадобиться добавить ключь на Heroku or GitHub, ниже я приведу инструкцию как это сделать.

GitHub

Run the following code to copy the key to your clipboard.

	$ sudo apt-get install xclip                 # Downloads and installs xclip
	$ xclip -sel clip < ~/.ssh/id_rsa.pub        # Copies the contents of the id_rsa.pub file to your clipboard

	1. Go to your Account Settings in GitHub.
	2. Click "SSH Keys" in the left sidebar.
	3. Click "Add SSH key".
	4. Paste your key into the "Key" field.
	5. Click "Add key".
	6. Confirm the action by entering your GitHub password.

Heroku

В случае с heroku все очень просто. Для начала вы не забудьте зарегистрироваться на heroku. Пройдите процедуру логинизации в терминали и просто выполните ниже приведенную команду

	$ heroku keys:add   

											
											Как залить сайт на heroku.


После создания учетной записи Heroku, установите гем Heroku:

	$ sudo gem install heroku

Как и с GitHub, при использовании Heroku вы должны будете создать ключи SSH если у вас их еще нет, а затем сообщить Heroku свой открытый ключ так, чтобы можно было использовать Git, для отправки репозитория примера приложения на их серверы:

	$ heroku keys:add

Наконец, используйте heroku команду, чтобы создать для примера приложения место на серверах Heroku.

 	$ heroku create
	Created http://severe-fire-61.heroku.com/ | git@heroku.com:severe-fire-61.git
	Git remote heroku added

До этого не забудьте запихнуть ваше приложение в Git. И отправляйте его на сервер.

	$ sudo git init 				# Необходимо сделать один раз при первой инициализации
	$ sudo git status				# Так зацените для интереса
	$ sudo git add .
	$ sudo git commit -m "First commit"

	$ git push heroku master

При загрузке приложения на сервер могут возникнуть различные проблеммы. Их не трудно решить. Я лишь
приведу те, решения, которые так просто в гугле не найти.

Во-первых. Heroku плохо работает с русскими символами из-за этого может крашиться ваше приложение, чтобы этого не происходило прописывайте в начале контроллера такую строку

	#encoding: utf-8

Во-вторых. Heroku работает с pg базой данных. Вы скорее всего будете работать с sqllite3. Для того, чтобы решить эту проблемму просто добавьте в Gemfile такой код.

	group :production do
 		# Database for heroku
  		gem 'pg'
	end
	
	group :development do
 		# База данных с которой вы работаете. Внимание удалите этот комм, чтобы не крашнулось ваше приложение # на heroku
 		gem 'sqlite3'
	end

Теперь выполните такую команду в терминале.

	bundle install --without production

Теперь не забудьте обновить Git репозиторий и смело отправляйте приложение на Heroku.

											Как залить сайт на GitHub

Залить сайт на GitHub очень просто. Не забудьте создать репозиторий приложения Git. Далее просто выполняйте такие команды.

	$ sudo git remote add hithub git@github.com:arthur12345543/CollegePortal.git

		or such as this one

	$ sudo git remote add hithub git@github.com:your's login/Application name.git

	$ git push -u hithub master

											Как переписывать origin

	$ git remote -v                      # можно, даже нужно заценить 
	 
	$ git remote rm origin

	$ git remote add origin git@github.com:arthur12345543/CollegePortal.git

		or such as this one

	$ git remote add origin git@github.com:your's login/Application name.git

											Как установить права на файл

	$ sudo chmod 777 .git/objects
	$ sudo chmod -R 0777 .git/objects
	$ sudo chown -R asgard .git               # установить полные права для юзера

		or such as this one

	$ sudo chmod 777 file

	$ sudo chown -R user .git

											Как выкачать репозиторий

Сперва мне пришлось установить полные права для своего пользователя, ну, конечно, три часа до этого я боролся с ошибками.

	$ sudo chown -R asgard .git     # replace asgard to your user

Далее, выполняем команду с помощью которой узнаем свою ветку

	$ git branch -a

Ответ у меня такой

		* master
  		remotes/origin/master

  	$ git pull origin master

Пока что у меня новая ошибка.

Во-первых приходится делать права для некоторых файлов лично.

	$ sudo chmod -R 0777 .gitignore

Пришлось так сделать. Была ошибка.

	


