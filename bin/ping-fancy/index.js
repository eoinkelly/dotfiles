#!/usr/bin/env node

var p = require("ping-output")
var blessed = require("blessed");
var contrib = require("blessed-contrib");

var DOT_NZ_DNS_SERVER = "202.46.190.130";
var chartData = { // initial state chart data
	x: [
			 "x", "x", "x", "x", "x",
			 "x", "x", "x", "x", "x"
		 ],
	y: [
			0, 0, 0, 0, 0,
			0, 0, 0, 0, 0
		]
};


/*
 * Setup screen
 *
 */

var screen = blessed.screen();
var line = contrib.line({
    style: {
      line: "red",
      text: "green",
      baseline: "black"
    },
    xLabelPadding: 3,
    xPadding: 5,
    label: "Ping RTT to .nz DNS server (ms)"
  });

screen.append(line) //must append before setting data

screen.key(["escape", "q", "C-c"], function(ch, key) {
  return process.exit(0);
});

/*
 * Do first render
 *
 */

line.setData([chartData])
screen.render()

/*
 * Setup pinging
 *
 */

var ping = new p.PingOutput()

ping.on("ping:output", function(data) {
	var matches = / time=(.+?) ms/.exec(data.toString());
  var time = 0;

	if (matches) {
		time = parseFloat(matches[1], 10);
  }

  // update the chart data
	chartData.y.shift();
	chartData.y.push(time);

  // re-render the line graph
	line.setData([chartData])
	screen.render()
});

// Start pinging
ping.start(DOT_NZ_DNS_SERVER);
