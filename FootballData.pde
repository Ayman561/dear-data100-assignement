

Table footballData;

void setup() {
  size(800, 600);
  footballData = loadTable("football_data.csv", "header");
  background(20, 30, 50);

  fill(255);
  textSize(26);
  text("My Football Data", 40, 50);

  textSize(18);
  text("Total observations: " + footballData.getRowCount(), 40, 100);

  for (int i = 0; i < footballData.getRowCount(); i++) {
    String activity = footballData.getString(i, "activity");

    float x = 50 + (i % 10) * 70;
    float y = 190 + (i / 10) * 35;

    if (activity.toLowerCase().contains("score")) {
      fill(70, 150, 255);
    } else if (activity.toLowerCase().contains("news")) {
      fill(255, 180, 50);
    } else if (activity.toLowerCase().contains("highlight")) {
      fill(70, 220, 130);
    } else {
      fill(220, 100, 180);
    }

    ellipse(x, y, 18, 18);
  }

  textSize(14);
  fill(70, 150, 255);
  ellipse(55, 540, 12, 12);
  fill(255);
  text("Scores", 70, 545);

  fill(255, 180, 50);
  ellipse(180, 540, 12, 12);
  fill(255);
  text("News", 195, 545);

  fill(70, 220, 130);
  ellipse(285, 540, 12, 12);
  fill(255);
  text("Highlights", 300, 545);

  fill(220, 100, 180);
  ellipse(420, 540, 12, 12);
  fill(255);
  text("Other football activities", 435, 545);
}
