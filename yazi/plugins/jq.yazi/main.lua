--- @sync peek
-- Pretty-print JSON with jq. Falls back to jq's error on invalid JSON.
local M = {}

function M:peek(job)
	local output, err = Command("jq")
		:arg("--monochrome-output")
		:arg(".")
		:arg(tostring(job.file.url))
		:stdout(Command.PIPED)
		:stderr(Command.PIPED)
		:output()

	local text
	if not output then
		text = "jq failed: " .. tostring(err)
	elseif output.status.success then
		text = output.stdout or ""
	else
		text = output.stderr ~= "" and output.stderr or "Invalid JSON"
	end

	local lines = {}
	for line in (text .. "\n"):gmatch("(.-)\n") do
		lines[#lines + 1] = line
	end

	local shown = {}
	for i = job.skip + 1, math.min(#lines, job.skip + job.area.h) do
		shown[#shown + 1] = lines[i]
	end

	ya.preview_widgets(job, {
		ui.Text(table.concat(shown, "\n")):area(job.area),
	})
end

function M:seek(job)
	local h = cx.active.current.hovered
	if h and h.url == job.file.url then
		ya.mgr_emit("peek", {
			math.max(0, cx.active.preview.skip + job.units),
			only_if = job.file.url,
		})
	end
end

return M
