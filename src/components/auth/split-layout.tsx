import type * as React from "react";
import Box from "@mui/material/Box";
import Stack from "@mui/material/Stack";
import Typography from "@mui/material/Typography";

export interface SplitLayoutProps {
	children: React.ReactNode;
}

export function SplitLayout({ children }: SplitLayoutProps): React.JSX.Element {
	return (
		<Box sx={{ display: "grid", gridTemplateColumns: { xs: "1fr", lg: "1fr 800px" }, minHeight: "100%" }}>
			<Box
				sx={{
					alignItems: "center",
					justifyContent: "center",
					bgcolor: "var(--mui-palette-background-level1)",
					display: { xs: "none", lg: "flex" },
					flexDirection: "column",
					p: 3,
				}}
			>
				<Stack spacing={4} sx={{ maxWidth: "700px" }}>
					<Stack spacing={1}>
						<Typography variant="h4">Welcome to B3BW Sistemas</Typography>
						<Typography color="text.secondary">
							B3BW Sistemas offers intelligent solutions for process and workflow management, helping companies automate activities, standardize workflows, and increase operational efficiency.<br />

							Our platform was developed to simplify process control, promote collaboration between teams, and provide greater visibility into operations, enabling faster and more confident decisions.<br /> <br />

							<b>Transform your processes into results with technology, agility, and innovation.</b>
						</Typography>
					</Stack>
				</Stack>
			</Box>
			<Box sx={{ boxShadow: "var(--mui-shadows-8)", display: "flex", flexDirection: "column" }}>
				<Box
					sx={{
						alignItems: "center",
						display: "flex",
						flexDirection: "column",
						flex: "1 1 auto",
						justifyContent: "center",
						p: 3,
					}}
				>
					<Box sx={{ maxWidth: "420px", width: "100%" }}>{children}</Box>
				</Box>
			</Box>
		</Box>
	);
}
