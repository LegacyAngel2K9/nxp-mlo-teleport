window.addEventListener("message", function (event) {
    const data = event.data;
    if (data.action === "open") {
        showMenu(data.locations);
    }
});

function showMenu(locations) {
    const container = document.getElementById("locations");
    container.innerHTML = "";

    for (const category in locations) {
        const group = locations[category];

        const section = document.createElement("div");
        section.className = "category";

        const header = document.createElement("h2");
        header.textContent = category;
        section.appendChild(header);

        group.forEach((loc, index) => {
            const button = document.createElement("button");
            button.textContent = loc.name;
            button.onclick = () => teleport(category, index);
            section.appendChild(button);
        });

        container.appendChild(section);
    }

    document.getElementById("app").style.display = "block";
}

function teleport(category, index) {
    fetch(`https://${GetParentResourceName()}/teleportTo`, {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({ category, index })
    });
}

function closeMenu() {
    document.getElementById("app").style.display = "none";

    fetch(`https://${GetParentResourceName()}/closeMenu`, {
        method: "POST"
    });
}
