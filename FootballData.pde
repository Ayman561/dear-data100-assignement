
Table footballData;
FootballObservation[] observations;

void setup() {
  size(800, 650);
  footballData = loadTable("football_data.csv", "header");

  observations = new FootballObservation[footballData.getRowCount()];

  for (int i = 0; i < footballData.getRowCount(); i++) {
    String activity = footballData.getString(i, "activity");
    String platform = footballData.getString(i, "platform");
    String topic = footballData.getString(i, "team_or_topic");

    observations[i] = new FootballObservation(activity, platform, topic);
  }

  background(20, 30, 50);

  fill(255);
  textSize(26);
  text("My Football Data", 40, 50);

  textSize(16);
  text("Each circle represents one football observation.", 40, 85);
  text("Total observations: " + observations.length, 40, 120);

  for (int i = 0; i < observations.length; i++) {
    String activity = observations[i].activity.toLowerCase();

    float x = 50 + (i % 10) * 70;
    float y = 170 + (i / 10) * 35;

    if (activity.contains("score")) {
      fill(70, 150, 255);
    } else if (activity.contains("news")) {
      fill(255, 180, 50);
    } else if (activity.contains("highlight")) {
      fill(70, 220, 130);
    } else {
      fill(220, 100, 180);
    }

    ellipse(x, y, 20, 20);
  }

  textSize(14);

  fill(70, 150, 255);
  ellipse(50, 570, 12, 12);
  fill(255);
  text("Scores", 65, 575);

  fill(255, 180, 50);
  ellipse(150, 570, 12, 12);
  fill(255);
  text("News", 165, 575);

  fill(70, 220, 130);
  ellipse(245, 570, 12, 12);
  fill(255);
  text("Highlights", 260, 575);

  fill(220, 100, 180);
  ellipse(365, 570, 12, 12);
  fill(255);
  text("Other", 380, 575);
}
