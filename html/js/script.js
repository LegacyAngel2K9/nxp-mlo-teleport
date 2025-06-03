let selectedLocation = null;

$(document).ready(function () {
    window.addEventListener('message', function (event) {
        if (event.data.type === 'toggleMenu') {
            $('#teleport-menu').toggleClass('hidden');
            if (!$('#teleport-menu').hasClass('hidden')) {
                renderLocations(event.data.locations);
                $('#location-search').val('').focus();
            }
        }
    });

    $('#location-search').on('input', function () {
        const term = $(this).val().toLowerCase();
        $('.location-item').each(function () {
            const txt = $(this).find('.location-name').text().toLowerCase() +
                        $(this).find('.location-desc').text().toLowerCase();
            $(this).toggle(txt.includes(term));
        });
    });

    $('#cancel-teleport').click(() => {
        $('#preview-modal').addClass('hidden');
        selectedLocation = null;
    });

    $('#confirm-teleport').click(() => {
        if (selectedLocation) {
            $.post('https://nxp-tp-menu/teleport', JSON.stringify({
                spawn: selectedLocation.spawn,
                camera: selectedLocation.camera
            }));
            closeMenu();
        }
    });

    $('#close-menu').click(closeMenu);

    $(document).keyup(e => {
        if (e.key === "Escape") {
            if (!$('#preview-modal').hasClass('hidden')) {
                $('#preview-modal').addClass('hidden');
            } else if (!$('#teleport-menu').hasClass('hidden')) {
                closeMenu();
            }
        }
    });
});

function renderLocations(categories) {
    const list = $('.location-list');
    list.empty();

    categories.forEach(cat => {
        const catElem = $(`<div class="location-category"><h3>${cat.name}</h3></div>`);
        cat.locations.forEach(loc => {
            const el = $(`
                <div class="location-item"
                     data-spawn='${JSON.stringify(loc.coords.spawn)}'
                     data-camera='${JSON.stringify(loc.coords.camera)}'>
                    <i class="fas ${loc.icon}"></i>
                    <div class="location-info">
                        <span class="location-name">${loc.name}</span>
                        <span class="location-desc">${loc.desc}</span>
                    </div>
                </div>
            `);

            el.click(function () {
                selectedLocation = {
                    spawn: JSON.parse($(this).attr('data-spawn')),
                    camera: JSON.parse($(this).attr('data-camera')),
                    name: $(this).find('.location-name').text(),
                    desc: $(this).find('.location-desc').text(),
                    icon: $(this).find('i').attr('class')
                };
                showPreview(selectedLocation);
            });

            catElem.append(el);
        });
        list.append(catElem);
    });
}

function showPreview(location) {
    $('#preview-icon').attr('class', location.icon);
    $('#preview-name').text(location.name);
    $('#preview-desc').text(location.desc);
    $('#preview-x').text(location.spawn.x.toFixed(2));
    $('#preview-y').text(location.spawn.y.toFixed(2));
    $('#preview-z').text(location.spawn.z.toFixed(2));
    $('#preview-w').text(location.spawn.w.toFixed(2));
    $('#preview-modal').removeClass('hidden');
}

function closeMenu() {
    $('#teleport-menu').addClass('hidden');
    $('#preview-modal').addClass('hidden');
    selectedLocation = null;
    $.post('https://nxp-tp-menu/closeMenu', JSON.stringify({}));
}
