import { Link } from "@tanstack/react-router";
import { Github, Linkedin } from "lucide-react";

export function MainNav() {
  const menuItems = [
    { name: "Home", path: "/" },
    { name: "Projects", path: "/projects" },
    { name: "Resume", path: "/resume" },
    { name: "", path: "", stretch: true },
    {
      name: "GitHub",
      icon: <Github />,
      href: "https://github.com/iPanja",
      right: true,
    },
    {
      name: "LinkedIn",
      icon: <Linkedin />,
      href: "https://linked.in/<TODO>",
      right: true,
    },
  ];

  return (
    <nav className="bg-gray-100 w-screen">
      <ul className="flex px-2 py-4 w-screen">
        {menuItems.map((item) => {
          let contents;

          if (item.path) {
            contents = <Link to={item.path}>{item.name}</Link>;
          } else {
            contents = <Link to={item.href}>{item.icon}</Link>;
          }

          let className = "px-3 ";
          if (item.right) {
            className += "float-right";
          } else if (item.stretch) {
            className += "flex-grow";
          }

          return (
            <li key={item.name} className={className}>
              {contents}
            </li>
          );
        })}
      </ul>
    </nav>
  );
}
