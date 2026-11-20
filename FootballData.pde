
Table footballData;
FootballObservation[] observations;

void setup() {
  size(850, 850);

  footballData = loadTable("football_data.csv", "header");

  if (footballData == null) {
    println("Could not load football_data.csv");
    exit();
  }

  observations = new FootballObservation[footballData.getRowCount()];

  for (int i = 0; i < footballData.getRowCount(); i++) {
    String activity = footballData.getString(i, "activity");
    String platform = footballData.getString(i, "platform");
    String topic = footballData.getString(i, "team_or_topic");

    observations[i] = new FootballObservation(activity, platform, topic);
  }

  background(20, 30, 50);

  fill(255);
  textSize(30);
  text("My Football Habits", 40, 50);

  textSize(16);
  text("100 observations of my football activities", 40, 80);

  textSize(18);
  text("Each circle represents one observation", 40, 125);

  for (int i = 0; i < observations.length; i++) {

    String activity = observations[i].activity.toLowerCase();

    int x = 65 + (i % 10) * 75;
    int y = 190 + (i / 10) * 52;

    if (activity.contains("score")) {
      fill(70, 150, 255);
    } else if (activity.contains("news")) {
      fill(255, 180, 50);
    } else if (activity.contains("highlight")) {
      fill(70, 220, 130);
    } else {
      fill(220, 100, 180);
    }

    noStroke();
    ellipse(x, y, 27, 27);
  }

  textSize(16);

  fill(70, 150, 255);
  ellipse(65, 750, 15, 15);
  fill(255);
  text("Scores", 80, 755);

  fill(255, 180, 50);
  ellipse(190, 750, 15, 15);
  fill(255);
  text("News", 205, 755);

  fill(70, 220, 130);
  ellipse(295, 750, 15, 15);
  fill(255);
  text("Highlights", 310, 755);

  fill(220, 100, 180);
  ellipse(440, 750, 15, 15);
  fill(255);
  text("Other", 455, 755);

  textSize(14);
  fill(200);
  text("Total observations: " + observations.length, 40, 810);

  save("football_visualisation.png");
}
