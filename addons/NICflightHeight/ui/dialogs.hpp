class NIC_SetFlightHeight_Dialog {
    idd = 1001;
    name = "NIC_SetFlightHeight_Dialog";
    onLoad = "uiNamespace setVariable ['NIC_SetFlightHeight_Dialog', _this select 0];";
    onUnLoad = "uiNamespace setVariable ['NIC_SetFlightHeight_Dialog', nil];";
    movingEnable = false;
    enableSimulation = true;
    class controlsBackground {
        class Background_1100: RscText {
            idc = 1100;
            text = "";
            x = 0.06 * safezoneW + safezoneX;
            y = 0.12 * safezoneH + safezoneY;
            w = 0.08 * safezoneW;
            h = 0.09 * safezoneH;
            ColorBackground[] = {0,0,0,0.678431};
            ColorText[] = {1,1,0.925490,1};
        };
		class Background_1101: RscText {
            idc = 1101;
			text =  $STR_TITLE;
            x = 0.06 * safezoneW + safezoneX;
            y = 0.12 * safezoneH + safezoneY;
            w = 0.08 * safezoneW;
            h = 0.017 * safezoneH;
            ColorBackground[] = {0,0.5,0,0.678431};
            ColorText[] = {1,1,0.925490,1};
        };
    };
    class controls {
        class Edit_1102: RscEdit {
            idc = 1102;
            text = "";
            x = 0.07 * safezoneW + safezoneX;
            y = 0.15 * safezoneH + safezoneY;
            w = 0.03 * safezoneW;
            h = 0.025 * safezoneH;
            ColorBackground[] = {1,1,1,0};
            ColorText[] = {1,1,1,1};
            colorSelection[] = {0,0,0,1};
            colorDisabled[] = {0,0,0,1};
			onKeyDown = (_this select 1) call NIC_SFH_fnc_DialogSaveFlightHeight;
        };
        class Button_1103: RscButton {
            idc = 1103;
            text = "OK";
            x = 0.11 * safezoneW + safezoneX;
            y = 0.185 * safezoneH + safezoneY;
            w = 0.025 * safezoneW;
            h = 0.02 * safezoneH;
            ColorBackground[] = {0.4,0.4,0.4,0.3};
            ColorText[] = {1,1,1,1};
            font = TahomaB;
            colorFocused[] = {1,0.549019,0,1};
            colorDisabled[] = {0.545098,0.270588,0.074509,1};
			action = "closeDialog 0";
        };
		class Button_1104: RscButton {
            idc = 1104;
			text =  $STR_CURRENT_NIC_FLIGHT_HEIGHT;
            x = 0.065 * safezoneW + safezoneX;
            y = 0.185 * safezoneH + safezoneY;
            w = 0.035 * safezoneW;
            h = 0.02 * safezoneH;
            ColorBackground[] = {0.4,0.4,0.4,0.3};
            ColorText[] = {1,1,1,1};
            font = PuristaLight;
            colorFocused[] = {1,0.549019,0,1};
            colorDisabled[] = {0.545098,0.270588,0.074509,1};
			action = [] call NIC_SFH_fnc_DialogSaveFlightHeight;
			// action = 'current' call NIC_SFH_fnc_DialogSaveFlightHeight
        };
    };
};