interface ExperienceProps {
  company: string;
  position: string;
  range: string;
  description: string[];
}

export function Experience(props: ExperienceProps) {
  return (
    <div className="flex flex-col items-start border border-gray-600 rounded-sm p-2">
      <div className="flex flex-row">
        <h2 className="text-lg font-bold">{props.company}</h2>
        <span className="text-lg px-2"> - </span>
        <p className="text-lg">{props.position}</p>
      </div>
      <p className="text-sm mb-1">{props.range}</p>
      <ul className="list-disc pl-5">
        {props.description.map((entry) => {
          return <li className="py-0.5">{entry}</li>;
        })}
      </ul>
    </div>
  );
}
