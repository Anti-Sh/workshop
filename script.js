forms = document.getElementsByClassName("addforms"); // Все формы

const show = (obj) => {
  // Функция для смены отображаемой формы
  [].forEach.call(forms, (element) => {
    // Изменение видимости по значению SELECT
    element.style.display =
      element.id.replace("form", "") == obj.value ? "block" : "none";
  });
};

const badInputClass = "bad-input";

const toggleBadInput = (regexp, target) => {
  // Функция проверки BadInput
  if (regexp.test(target.val())) {
    target.removeClass("bad-input");
  } else {
    target.addClass("bad-input");
  }
};

$(() => {
  // Добавление маски ввода к input с номером телефона
  $(".tel").mask("8(999)999-99-99");

  $('.client input[name="fullname"]').on("change", (e) => {
    // Проверка ввода имени клиента
    let reg = /^[А-ЯЁ][а-яё]*([-][А-ЯЁ][а-яё]*)?\s[А-ЯЁ][а-яё]*$/,
      target = $(e.currentTarget);

    toggleBadInput(reg, target);
  });

  $('.employee input[name="fullname"]').on("change", (e) => {
    // Проверка ввода имени сотрудника
    let reg =
        /^[А-ЯЁ][а-яё]*([-][А-ЯЁ][а-яё]*)?\s[А-ЯЁ][а-яё]*\s[А-ЯЁ][а-яё]*$/,
      target = $(e.currentTarget);

    toggleBadInput(reg, target);
  });

  $('input[name="email"]').on("change", (e) => {
    // Проверка ввода почты
    let reg = /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
      target = $(e.currentTarget);
    toggleBadInput(reg, target);
  });

  $("input").on("change", (e) => {
    // Изменение доступности кнопки отправки формы
    let inputs = $(e.currentTarget).parent().find("input");
    let notEmpty = inputs.filter((ind, item) => $(item).val() === "");
    $(e.currentTarget)
      .parent()
      .find(":submit")
      .first()
      .prop(
        "disabled",
        inputs.hasClass("bad-input") || notEmpty.length > 0 ? true : false
      );
  });
});
