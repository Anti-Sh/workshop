const forms = document.getElementsByClassName("addforms"); // Все формы
var currentMethod = 0;

const show = (obj) => {
  // Функция для смены отображаемой формы
  [].forEach.call(forms, (element) => {
    // Изменение видимости по значению SELECT
    element.style.display =
      element.id.replace("form", "") == obj.value ? "block" : "none";
  });
};

const setMethod = (obj) => (currentMethod = obj.value);

const onFormSubmit = (e) => {
  if (currentMethod != 3) {
    e.preventDefault();
    return currentMethod == 1 ? standardMethod() : DOMMethod();
  }
};

const DOMMethod = () => {
  console.log("DOM");
};

const standardMethod = () => {
  console.log("standard");
};
