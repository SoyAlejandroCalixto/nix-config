{ config, ... }:
{
  home-manager.users.kappy.programs.rofi = {
    enable = true;
    theme = let
      lit = value: { _type = "literal"; inherit value; };
    in {
      "*" = {
        font = "Onest Bold 14";
        margin = lit "0";
        padding = lit "0";
        spacing = lit "0";
        background-color = lit "transparent";
        text-color = lit "@unselected-text";
        bg = lit "#24273add";
        selected-text = lit "#181926";
        unselected-text = lit "#a5adcb";
        placeholder = lit "#8aadf480";
        blue = lit "#8aadf4";
      };
      "window" = {
        background-color = lit "@bg";
        location = lit "center";
        width = lit "670";
        border-radius = lit "20";
        border = lit "5px";
        border-color = lit "@blue";
      };
      "inputbar" = {
        font = "Onest Bold 24";
        padding = lit "30px 20px";
        children = lit "[ entry ]";
      };
      "entry" = {
        font = lit "inherit";
        placeholder = "???";
        placeholder-color = lit "@placeholder";
        color = lit "@blue";
      };
      "listview" = {
        lines = lit "10";
        columns = lit "1";
        fixed-height = false;
        margin = lit "0px 0px 10px 0px";
      };
      "element" = {
        padding = lit "10px";
        spacing = lit "16px";
        margin = lit "0px 10px";
        border-radius = lit "10";
        background-color = lit "transparent";
      };
      "element selected normal, element selected active" = {
        background-color = lit "@blue";
        text-color = lit "@selected-text";
      };
      "element-icon" = {
        size = lit "1em";
      };
      "element-text" = {
        text-color = lit "inherit";
        highlight = lit "none";
      };
    };
  };
}