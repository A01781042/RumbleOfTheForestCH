

async function setupChar()
{
    let response = await fetch('http://localhost:5000/api/notes_stats',{
        method: 'GET'
    })

    if(response.ok)
    {
        let results = await response.json()
    console.log(results ["perfect_percentage"])

    const values = Object.values(results)
    console.log(values [0] ["name"])

    const data = {
        labels: [
          'Perfect',
          'Good',
          'Hit',
          'Missed'
        ],
        datasets: [{
          label: 'Acurrancy Percentage',
          data: [values [0] ["perfect_percentage"], values [0] ["good_percentage"], values [0] ["hit_percentage"], values [0] ["missed_percentage"]],
          backgroundColor: [
            'rgb(255, 99, 132)',
            'rgb(54, 162, 235)',
            'rgb(255, 205, 86)',
            'rgb(254, 145, 92'
          ],
          hoverOffset: 4
        }]
      }
    
    const ctx = document.getElementById('pieChart').getContext('2d')  
    
    const myChart =
          new Chart(ctx, {
        type: "pie",
        data: data,
        options: {}
      });
}
};

setupChar()