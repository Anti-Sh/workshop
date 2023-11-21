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

  // Сортировка
  $("#clients").tablesorter({
    widgets: ["zebra"],
  });
  $("#employes").tablesorter({});

  // Отправка форм

  $("#form1").on("submit", (e) => {
    e.preventDefault();

    let fullname = $(e.currentTarget).children("#fullname").val(),
      email = $(e.currentTarget).children("#email").val(),
      telephone = $(e.currentTarget).children("#telephone").val(),
      birth = $(e.currentTarget).children("#birth").val();

    $.ajax({
      url: "./vendor/client.php",
      method: "post",
      dataType: "html",
      data: {
        fullname,
        email,
        telephone,
        birth,
      },
      success: () => {
        let table = $("#clients tbody"),
          newId = table.children("tr").length + 1;

        table.append(
          $(`<tr ${newId % 2 == 1 ? 'class="odd"' : ""}>
          <td>${newId}</td>
          <td>${fullname}</td>
          <td>${email}</td>
          <td>${telephone}</td>
          <td>${birth}</td>
        </tr>`)
        );
        e.currentTarget.reset();
      },
    });
  });

  $("#cl_del").on("submit", (e) => {
    let id = $(e.currentTarget).children("#row_index").val();
    e.preventDefault();

    $.ajax({
      url: "./vendor/client_delete.php",
      method: "post",
      dataType: "html",
      data: {
        row_index: id,
      },
      success: () => {
        let elem = $("#clients")
          .children("tbody")
          .children("tr")
          .eq(id - 1);

        let newTable = $("#arch_clients tbody"),
          newId = newTable.children("tr").length + 1;
        elem.children("td").eq(0).html(newId);

        newTable.append(
          $(`<tr ${newId % 2 == 1 ? 'class="odd"' : ""}>${elem.html()}</tr>`)
        );
        elem.remove();

        e.currentTarget.reset();
      },
    });
  });

  $("#cl_restore").on("submit", (e) => {
    let id = $(e.currentTarget).children("#row_index").val();
    e.preventDefault();

    $.ajax({
      url: "./vendor/client_restore.php",
      method: "post",
      dataType: "html",
      data: {
        row_index: id,
      },
      success: () => {
        let elem = $("#arch_clients")
          .children("tbody")
          .children("tr")
          .eq(id - 1);

        let newTable = $("#clients tbody"),
          newId = newTable.children("tr").length + 1;
        elem.children("td").eq(0).html(newId);

        newTable.append(
          $(`<tr ${newId % 2 == 1 ? 'class="odd"' : ""}>${elem.html()}</tr>`)
        );
        elem.remove();

        e.currentTarget.reset();
      },
    });
  });

  $("#cl_put").on("submit", (e) => {
    e.preventDefault();
    e.preventDefault();

    let fullname = $(e.currentTarget).children("#fullname").val(),
      row_index = $(e.currentTarget).children("#row_index").val(),
      email = $(e.currentTarget).children("#email").val(),
      telephone = $(e.currentTarget).children("#telephone").val(),
      birth = $(e.currentTarget).children("#birth").val();

    let table = $("#clients tbody"),
      newId = table.children("tr").length + 1;

    let elem =
      table.children("tr").length == 0
        ? $("clients tbody")
        : $("clients tbody")
            .children("tr")
            .eq(row_index - 1);

    let elementForAdding = $(`<tr ${row_index % 2 == 1 ? 'class="odd"' : ""}>
    <td>${row_index}</td>
    <td>${fullname}</td>
    <td>${email}</td>
    <td>${telephone}</td>
    <td>${birth}</td>
  </tr>`);
    if (row_index > 1) {
      elem.after(elementForAdding);
    } else {
      elem.append(elementForAdding);
    }
    console.log(elem);
    // $.ajax({
    //   url: "./vendor/client_put.php",
    //   method: "post",
    //   dataType: "html",
    //   data: {
    //     fullname,
    //     email,
    //     telephone,
    //     birth,
    //     row_index,
    //   },
    //   success: () => {
    //     let elem = $("clients")
    //       .children("tbody")
    //       .children("tr")
    //       .eq(row_index - 1);

    //     let table = $("#clients tbody"),
    //       newId = table.children("tr").length + 1;

    //     let element = `
    //       <td>${newId}</td>
    //       <td>${fullname}</td>
    //       <td>${email}</td>
    //       <td>${telephone}</td>
    //       <td>${birth}</td>
    //     `;

    //     elem.html(element);
    //     e.currentTarget.reset();
    //   },
    // });
  });
});
