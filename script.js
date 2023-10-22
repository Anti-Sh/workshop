const forms = document.getElementsByClassName("addforms"); // Все формы

const show = (obj) => {
  // Функция для смены отображаемой формы
  [].forEach.call(forms, (element) => {
    // Изменение видимости по значению SELECT
    element.style.display =
      element.id.replace("form", "") == obj.value ? "block" : "none";
  });
};
