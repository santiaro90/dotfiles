-- Render Markdown with glow (ANSI-styled, dark theme).
-- yazi spawns commands with a stripped env, so glow sees no color support and
-- emits plain text. Force color + a color-capable TERM to get styled output.
local M = {}

function M:peek(job)
	local output, err = Command("glow")
		:arg("--style")
		:arg("dark")
		:arg("--width")
		:arg(tostring(math.max(job.area.w, 1)))
		:arg(tostring(job.file.url))
		:env("CLICOLOR_FORCE", "1")
		:env("COLORTERM", "truecolor")
		:env("TERM", "xterm-256color")
		:stdout(Command.PIPED)
		:stderr(Command.PIPED)
		:output()

	local text
	if not output then
		text = "glow failed: " .. tostring(err)
	elseif output.status.success then
		text = output.stdout or ""
	else
		text = output.stderr ~= "" and output.stderr or "glow failed"
	end

	local lines = {}
	for line in (text .. "\n"):gmatch("(.-)\n") do
		lines[#lines + 1] = line
	end

	local shown = {}
	for i = job.skip + 1, math.min(#lines, job.skip + job.area.h) do
		shown[#shown + 1] = lines[i]
	end

	-- glow emits ANSI escapes; ui.Text.parse turns them into styled spans.
	ya.preview_widget(job, ui.Text.parse(table.concat(shown, "\n")):area(job.area))
end

function M:seek(job)
	local h = cx.active.current.hovered
	if h and h.url == job.file.url then
		ya.emit("peek", {
			math.max(0, cx.active.preview.skip + job.units),
			only_if = job.file.url,
		})
	end
end

return M
