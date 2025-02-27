# README
* git clone https://github.com/sergeypal/blog-2025-1
* cd blog-2025-1
* bundle install
* rails db:migrate
* rails s

Выполняемые комманды:<br>
`rails new blog-2025-1` — создание нового проекта<br>
`cd blog-2025-1` — перейти в новый проект<br>
`rails generate controller Articles index --skip-routes` — создаём контроллер Articles для работы со статьями<br>
`rails generate model Article title:string body:text` — создаём модель Article (статья) с двумя полями: title (заголовок) и body (текст)<br>
`rails generate model Comment commenter:string body:text article:references` — создаём модель Comment (комментарий) c тремя полями: commenter (комментатор), body (комментарий) и article (привязска к статье)<br>
`rails generate controller Comments` — создаём контроллер Comments для работы с комментариями<br>
`rails generate migration AddStatusToArticles status:string` — добавляем поле status (статус) к статье (это было в мануале)<br>
`rails generate migration AddStatusToComments status:string` — добавляем поле status (статус) к комментарию (это было в мануале)<br>
`rails generate devise:install` — устанавливаем devise (механизм аутентикации)<br>
`rails generate devise User` — создаём модель User (пользователь) для работы с механизмом аутентикации<br>
`rails g migration AddUserToArticle user:references` — добавляем таблицу связи пользователя со статьёй<br>
`rails g migration AddUserToComment user:references` — добавляем таблицу связи пользователя с комментарием<br>
`rails generate model LikeArticle user:references article:references` — создаём модель LikeArticle (лайки к статьям)<br>
`rails generate model LikeComment user:references comment:references` — создаём модель LikeComment (лайки к комментариям)<br>
`rails generate controller LikeArticles` — создаём контроллер LikeArticles для лайков/дизлайков к статьям<br>
`rails generate controller LikeComments` — создаём контроллер LikeArticles для лайков/дизлайков к комментариям<br>
`rails db:migrate` — прогоняем миграции БД<br>
`rails server` — запускаем сервер

Модели:<br>
`1. article` — Статьи<br>
`2. comment` — Комментарий<br>
`3. like_article` — Лайки к статье<br>
`4. like_comment` — Лайки к комментариям<br>
`5. user` — Пользователь<br>

Контроллеры:<br>
`1. app/controllers/articles_controller.rb` — контроллер для работы со статьями:<br>
`1.1. before_action :authenticate_user!, except: %i(index show)` — требуем авторизацию пользователя кроме списка и просмотра статей<br>
`1.2. show` – просмотр конкретной статьи<br>
`1.3. new` – страница создания новой статьи<br>
`1.4. create` – создание новой статьи<br>
`1.5. edit` – страница редактирования существующей статьи<br>
`1.6. update` – обновление существующей статьи<br>
`1.7. destroy` – удаление существующей статьи (пока без проверки привязки к автору)<br>
`1.8. article_params` – разрешённые параметры для сохранения/обновления<br>
`2. app/controllers/comments_controller.rb` — контроллер для работы с комментариями:<br>
`2.1. before_action :authenticate_user!` — требуем авторизацию пользователя<br>
`2.2. create` – создание нового комментария<br>
`2.3. destroy` – удаление комментария (пока без проверки привязки к автору)<br>
`2.4. comment_params` – разрешённые параметры для сохранения/обновления<br>
`3. app/controllers/like_articles_controller.rb` — контроллер для работы с лайками к статье:<br>
`3.1. before_action :authenticate_user!` — требуем авторизацию пользователя<br>
`3.2. create` – ставим лайк статье<br>
`3.3. destroy` – убираем лайк у статьи<br>
`4. app/controllers/like_comments_controller.rb` — контроллер для работы с лайками к комментариям:<br>
`4.1. before_action :authenticate_user!` — требуем авторизацию пользователя<br>
`4.2. create` – ставим лайк комментарию<br>
`4.3. destroy` – убираем лайк у комментария<br>

Папки `app/views`:<br>
`1. articles` — шаблоны к статьям:<br>
`1.1. _form` — форма добавления новой и редактирования существующей статьи (вызывается из new и edit)<br>
`1.2. edit` — страница редактирования статьи<br>
`1.3. index` — страница списка статей<br>
`1.4. new` — страница добавления новой стать<br>
`1.5. show` — детальная страница статьи<br>
`2. articles` — шаблоны к статьям:<br>
`2.1. _comment` — вывод конкретного комментария (вызывается через `<% render @article.comments %>` в шаблоне `articles/show`)<br>
`2.1. _form` — форма добавления нового комментария (вызывается через `<%= render 'comments/form' %>` в шаблоне `articles/show`)<br>
`3. layouts` — layout / основные шаблоны сайта:<br>
`3.1. application` — основной шаблон сайта, по которому строится итоговая HTML-страница<br>
