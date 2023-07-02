# Rails курс USD ![](https://github.com/kirkhal0909/rails_test/actions/workflows/exchange_rate.yml/badge.svg)

## Используется:
-**Backend Rails** с web bundler - **esbuild**\
-загрузка курса из cbr\
-**Vue** + **Vite**\
-обновление курса по **WebSocket** (**ActionCable**)\
-курс запрашивается периодически с фронта\
-установка фиксированного курса через админку до определённого времени (http://localhost:3000/admin)

## Установка гемов и библиотек
```
yarn install
bundle install
```

## Запуск
```
foreman start
```

## Страница с курсом
http://localhost:3000

## Страница с изменением значения
http://localhost:3000/admin

![](_readme/app.gif)
