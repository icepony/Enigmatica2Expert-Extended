## Minecraft load time benchmark


---

<p align="center" style="font-size:160%;">
MC total load time:<br>
246.91 sec
<br>
<sup><sub>(
4:6 min
)</sub></sup>
</p>

<br>


<p align="center">
<img src="https://quickchart.io/chart?w=400&h=30&c={
  type: 'horizontalBar',
  data: {
    datasets: [
      {label:      'MODS:', data: [106.33]},
      {label: 'FML stuff:', data: [140.57]}
    ]
  },
  options: {
    scales: {
      xAxes: [{display: false,stacked: true}],
      yAxes: [{display: false,stacked: true}],
    },
    elements: {rectangle: {borderWidth: 2}},
    legend: {display: false,},
    plugins: {datalabels: {color: 'white',formatter: (value, context) =>
      [context.dataset.label, value].join(' ')
    }}
  }
}"/>
</p>

<br>

# Mods Loading Time
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=300&c={
  type: 'outlabeledPie',
  options: {
    cutoutPercentage: 25,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v,i)=>[
          v.labels[v.dataIndex],' ',
          (v.percent*1000|0)/10,
          String.fromCharCode(37)].join('')
      }
    }
  },
  data: {...
`
516fa8   5.31s Ender IO;
813e81   5.06s OpenComputers;
8f304e   5.01s Astral Sorcery;
a651a8   4.45s IndustrialCraft 2;
cd922c   3.66s NuclearCraft;
5161a8   3.36s CraftTweaker2;
495797   8.09s CraftTweaker2 (Script Loading);
213664   2.62s Forestry;
a86e51   2.15s Extra Utilities 2;
308f7e   2.04s Quark: RotN Edition;
ba3eb8   2.01s Cyclic;
436e17   1.93s Integrated Dynamics;
3e8160   1.89s The Twilight Forest;
8f4d30   1.72s Open Terrain Generator;
3eb2ba   1.63s Botania;
8c2ccd   1.59s Immersive Engineering;
3eba85   1.43s Just Enough Magiculture;
649e21   1.37s OpenBlocks;
3e68ba   1.36s AE2 Unofficial Extended Life;
61176e   1.33s Ice and Fire;
814a3e   1.27s RFTools;
444444   9.64s 9 Other mods;
333333  37.76s 126 'Fast' mods (load 1.0s - 0.1s);
222222   7.75s 300 'Instant' mods (load %3C 0.1s)
`
    .split(';').reduce((a, l) => {
      l.match(/(\w{6}) *(\d*\.\d*)s (.*)/)
      .slice(1).map((a, i) => [[String.fromCharCode(35),a].join(''), parseFloat(a), a][i])
      .forEach((s, i) => 
        [a.datasets[0].backgroundColor, a.datasets[0].data, a.labels][i].push(s)
      );
      return a
    }, {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 1
      }]
    })
  }
}"/>
</p>

<br>

# Top Mods Details (except JEI, FML and Forge)
<p align="center">
<img src="https://quickchart.io/chart?w=400&h=450&c={
  options: {
    scales: {
      xAxes: [{stacked: true}],
      yAxes: [{stacked: true}],
    },
    plugins: {
      datalabels: {
        anchor: 'end',
        align: 'top',
        color: 'white',
        backgroundColor: 'rgba(46, 140, 171, 0.6)',
        borderColor: 'rgba(41, 168, 194, 1.0)',
        borderWidth: 0.5,
        borderRadius: 3,
        padding: 0,
        font: {size:10},
        formatter: (v,ctx) => 
          ctx.datasetIndex!=ctx.chart.data.datasets.length-1 ? null
            : [((ctx.chart.data.datasets.reduce((a,b)=>a- -b.data[ctx.dataIndex],0)*10)|0)/10,'s'].join('')
      },
      colorschemes: {
        scheme: 'office.Damask6'
      }
    }
  },
  type: 'bar',
  data: {...(() => {
    let a = { labels: [], datasets: [] };
`
1: Construction;
2: Loading Resources;
3: PreInitialization;
4: Initialization;
5: InterModComms$IMC;
6: PostInitialization;
7: LoadComplete;
8: ModIdMapping
`
    .split(';')
      .map(l => l.match(/\d: (.*)/).slice(1))
      .forEach(([name]) => a.datasets.push({ label: name, data: [] }));
`
                        1      2      3      4      5      6      7      8  ;
Ender IO            |  1.25|  0.00|  3.86|  0.19|  0.00|  0.00|  0.00|  0.00;
OpenComputers       |  0.12|  0.00|  3.34|  1.59|  0.00|  0.00|  0.00|  0.00;
Astral Sorcery      |  0.17|  0.00|  4.30|  0.54|  0.00|  0.00|  0.00|  0.00;
IndustrialCraft 2   |  0.74|  0.01|  3.21|  0.50|  0.00|  0.00|  0.00|  0.00;
NuclearCraft        |  1.27|  0.00|  2.17|  0.22|  0.00|  0.00|  0.00|  0.00;
CraftTweaker2       |  0.45|  0.00|  2.91|  0.00|  0.00|  0.00|  0.00|  0.00;
Forestry            |  0.33|  0.00|  1.93|  0.36|  0.00|  0.00|  0.00|  0.00;
Extra Utilities 2   |  0.05|  0.00|  2.08|  0.02|  0.00|  0.00|  0.00|  0.00;
Quark: RotN Edition |  0.03|  0.00|  1.95|  0.06|  0.00|  0.00|  0.00|  0.00;
Cyclic              |  0.04|  0.00|  1.58|  0.38|  0.00|  0.00|  0.00|  0.00;
Integrated Dynamics |  0.19|  0.00|  1.71|  0.03|  0.00|  0.00|  0.00|  0.00;
The Twilight Forest |  0.64|  0.00|  1.14|  0.11|  0.00|  0.00|  0.00|  0.00
`
    .split(';').slice(1)
      .map(l => l.split('|').map(s => s.trim()))
      .forEach(([name, ...arr], i) => {
        a.labels.push(name);
        arr.forEach((v, j) => a.datasets[j].data[i] = v)
      }); return a
  })()}
}"/>
</p>

<br>

# TOP JEI Registered Plugis
<p align="center">
<img src="https://quickchart.io/chart?w=700&c={
  options: {
    elements: { rectangle: { borderWidth: 1 } },
    legend: false
  },
  type: 'horizontalBar',
    data: {...(() => {
      let a = {
        labels: [], datasets: [{
          backgroundColor: 'rgba(0, 99, 132, 0.5)',
          borderColor: 'rgb(0, 99, 132)',
          data: []
        }]
      };
`
  1.91: jeresources.jei.JEIConfig;
  0.78: com.rwtema.extrautils2.crafting.jei.XUJEIPlugin;
  0.51: com.buuz135.industrial.jei.JEICustomPlugin;
  0.46: com.buuz135.thaumicjei.ThaumcraftJEIPlugin;
  0.39: crazypants.enderio.machines.integration.jei.MachinesPlugin;
  0.37: mezz.jei.plugins.vanilla.VanillaPlugin;
  0.31: ic2.jeiIntegration.SubModule;
  0.27: nc.integration.jei.NCJEI;
  0.18: crazypants.enderio.base.integration.jei.JeiPlugin;
  0.17: knightminer.tcomplement.plugin.jei.JEIPlugin;
  0.17: cofh.thermalexpansion.plugins.jei.JEIPluginTE;
  0.11: crafttweaker.mods.jei.JEIAddonPlugin;
  0.11: ninjabrain.gendustryjei.GendustryJEIPlugin;
  0.10: net.bdew.jeibees.BeesJEIPlugin;
  0.09: lach_01298.qmd.jei.QMDJEI;
  1.15: Other 121 Plugins
`
        .split(';')
        .map(l => l.split(':'))
        .forEach(([time, name]) => {
          a.labels.push(name);
          a.datasets[0].data.push(time)
        })
        ; return a
    })()
  }
}"/>
</p>

<br>

# FML Stuff
<p align="center">
<img src="https://quickchart.io/chart?w=500&h=400&c={
  options: {
    rotation: Math.PI,
    cutoutPercentage: 55,
    plugins: {
      legend: !1,
      outlabels: {
        stretch: 5,
        padding: 1,
        text: (v)=>v.labels
      },
      doughnutlabel: {
        labels: [
          {
            text: 'FML stuff:',
            color: 'rgba(128, 128, 128, 0.5)',
            font: {size: 18}
          },
          {
            text: [140.57,'s'].join(''),
            color: 'rgba(128, 128, 128, 1)',
            font: {size: 22}
          }
        ]
      },
    }
  },
  type: 'outlabeledPie',
  data: {...(() => {
    let a = {
      labels: [],
      datasets: [{
        backgroundColor: [],
        data: [],
        borderColor: 'rgba(22,22,22,0.3)',
        borderWidth: 2
      }]
    };
`
993A00   0.27s Loading sounds;
994400   0.30s Loading Resource - SoundHandler;
444444 140.01s Other
`
    .split(';')
      .map(l => l.match(/(\w{6}) *(\d*\.\d*)s (.*)/))
      .forEach(([, col, time, name]) => {
        a.labels.push([name, ' ', time, 's'].join(''));
        a.datasets[0].data.push(parseFloat(time));
        a.datasets[0].backgroundColor.push([String.fromCharCode(35), col].join(''))
      })
      ; return a
  })()}
}"/>
</p>

<br>
