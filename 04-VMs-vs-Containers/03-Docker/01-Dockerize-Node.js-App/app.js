const express = require("express");

const app = express();

app.get("/", (req, res) => {
  res.send({
    message: "Server is successfully listening",
  });
});
const port = process.env.PORT || 3000;
app.listen(port, () => {
  console.log(`Server is running on port ${port}`);
});
