// JavaScript for the scoreboard

// Close the scoreboard when the close button is clicked
document.getElementById('close').addEventListener('click', function() {
    fetch(`https://${GetParentResourceName()}/close`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    }).then(resp => resp.json()).then(resp => {
        console.log(resp)
    });
});

// Fetch player data and update the scoreboard
function updateScoreboard() {
    fetch(`https://${GetParentResourceName()}/getPlayers`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json; charset=UTF-8',
        },
        body: JSON.stringify({})
    }).then(resp => resp.json()).then(resp => {
        const playersTable = document.querySelector('#players tbody');
        playersTable.innerHTML = '';
        resp.forEach(player => {
            const row = document.createElement('tr');
            row.innerHTML = `
                <td>${player.id}</td>
                <td>${player.name}</td>
                <td>${player.ping}</td>
                <td>${player.health}</td>
                <td>${player.armor}</td>
            `;
            playersTable.appendChild(row);
        });
    });
}

// Update the scoreboard every second
setInterval(updateScoreboard, 1000);
