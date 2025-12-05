import { withPluginApi } from "discourse/lib/plugin-api";

export default {
  name: "tv-test",

  initialize() {
    withPluginApi("0.8.31", (api) => {
      console.log("TV TEST INITIALIZER LOADED");
    });
  }
};
