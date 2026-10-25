
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
    float x = 50 + (i % 10) * 70;
    float y = 150 + (i / 10) * 35;

    fill(80, 180, 255);
    ellipse(x, y, 15, 15);
  }
}
