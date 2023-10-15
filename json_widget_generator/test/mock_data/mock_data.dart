var mockDataBanner = {
  "widgets": [
    {
      "type": "banner",
      "image":
          "https://www.shutterstock.com/image-vector/example-banner-vector-image-260nw-1841256889.jpg",
      "header_text": "New Recipe",
      "footer_text": "Cook Chicken Curry",
      "footer_icon": true
    },
    {
      "type": "banner",
      "color": "FF0000",
      "header_text": "Meal Planner",
      "footer_text": "Plan your meals",
      "border_radius": 6,
      "padding": 12,
      "footer_icon": false
    }
  ]
};

var mockDataBannerInvalid = {
  "widgets": [
    {
      "type": "banner",
      "image":
          "https://www.shutterstock.com/image-vector/example-banner-vector-image-260nw-1841256889.jpg",
      "header_text": "New Recipe",
      "footer_icon": true
    },
    {
      "type": "banner",
      "color": "FF0000",
      "header_text": "Meal Planner",
      "footer_text": "Plan your meals",
      "border_radius": 6,
      "padding": 12,
      "footer_icon": false
    }
  ]
};

var mockDataHorizontalList = {
  "widgets": [
    {
      "type": "horizontal_list",
      "title": "Collections",
      "items": [
        {
          "type": "box_item",
          "text": "Breakfast",
          "image": "https://path/to/image.png"
        },
        {"type": "circular_item", "image": "https://path/to/image.png"},
        {
          "type": "circular_item",
          "text": "Vegan",
          "image": "https://path/to/image.png"
        }
      ]
    }
  ],
};
