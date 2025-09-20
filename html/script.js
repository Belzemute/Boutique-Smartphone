const overlay = document.getElementById("overlay");
const menu = document.getElementById("phone-menu");
const list = document.getElementById("phone-list");

window.addEventListener('message', function(event) {
  if (event.data.action === "openPhoneMenu") {
    list.innerHTML = "";

    event.data.phones.forEach(phone => {
      const div = document.createElement("div");
      div.className = "phone-item";
      div.innerHTML = `
        <img src="${phone.image}" /><br>
        ${phone.label}<br>
        $${phone.price}<br>
        <span style="color:${phone.stock > 0 ? 'lime' : 'red'}">
          ${phone.stock > 0 ? `En stock (${phone.stock})` : 'Hors Stock'}
        </span>
      `;

      if (phone.stock > 0) {
        div.onclick = () => {
          fetch(`https://${GetParentResourceName()}/buyPhone`, {
            method: 'POST',
            body: JSON.stringify({ item: phone.item })
          });
        };
      } else {
        div.style.opacity = 0.5;
        div.style.cursor = "not-allowed";
      }

      list.appendChild(div);
    });

    menu.classList.remove("hidden");
    overlay.classList.remove("hidden");
  }
});

document.getElementById("close-btn").addEventListener("click", () => {
  menu.classList.add("hidden");
  overlay.classList.add("hidden");
  fetch(`https://${GetParentResourceName()}/closeMenu`, { method: 'POST' });
});
