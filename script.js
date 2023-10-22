const forms = document.getElementsByClassName("addforms"); // Все формы
var currentMethod = 1;

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
  // Обработка отправки формы
  if (currentMethod != 3) {
    e.preventDefault(); // Предотвращение отправки формы на сервер
    obj = getFormJSON(e.srcElement.children);
    return currentMethod == 1
      ? standardMethod(e.currentTarget.name, obj)
      : DOMMethod(e.currentTarget.name, obj);
  }
};

const DOMMethod = (formName, obj) => {
  // DOM добавление данных
  console.log(obj);
};

const standardMethod = (formName, obj) => {
  // Стандартный добавление данных
  let attrs = "";
  let formParts = formName.split("-");
  for (var key in obj) {
    attrs += `<${key}>${obj[key]}</${key}>`;
  }
  let element = `
    <${formParts[0]}>
      <${formParts[1]}>
        ${attrs}
      </${formParts[1]}>
    </${formParts[0]}>
  `;
  try {
    //Internet Explorer
    xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
    xmlDoc.async = "false";
    xmlDoc.loadXML(element);
  } catch (e) {
    try {
      //Firefox, Mozilla, Opera, etc.
      parser = new DOMParser();
      xmlDoc = parser.parseFromString(element, "text/xml");
    } catch (e) {
      alert(e.message);
    }
    console.log(xmlDoc);
  }
};

const getFormJSON = (inputs) => {
  // Получение данных формы в формате: название поля -> значение
  let obj = {};
  [].forEach.call(inputs, (element) => {
    if (
      (element.nodeName == "INPUT" && element.type !== "submit") ||
      element.nodeName == "SELECT"
    ) {
      obj[element.id] = element.value;
    }
  });
  return obj;
};
