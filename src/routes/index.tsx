import { createFileRoute } from "@tanstack/react-router";
// import logo from "../logo.svg";
import "../App.css";
import { Experience } from "@/components/Experience";

export const Route = createFileRoute("/")({
  component: App,
});

function App() {
  // <header className="App-header">Fletcher Henneman</header>
  return (
    <div className="App">
      <div className="p-2">
        <Experience
          company={"Penn State University"}
          position={"Student"}
          range={"2020-2024"}
          description={["Test sentence 1", "Test sentence 2"]}
        />
      </div>
    </div>
  );
}
