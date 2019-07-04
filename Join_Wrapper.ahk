/*

	Join API Module
		Grab your API Key from https://joaoapps.com/join/api/ and create a new object.
	Methods:
		__Get_DeviceID() - Grab available Device IDs and Parse into Objects
		
		

*/

class Join_API {
	
	__New(apiKEY) {
		
		this.apiKey := apiKEY
		;this.deviceIDsList := IDS := 
		Join_API.__Get_DeviceIDS(apiKEY)
		
	}
	__Get_DeviceIDS(apiKEY) {
		vjoin_DeviceIDs_URL = https://joinjoaomgcd.appspot.com/_ah/api/registration/v1/listDevices?apikey=%apiKEY%
		
		fetchDevicesIDsResponse := Object()
		
		Try {
			fetchDevicesIDs := ComObjCreate("WinHttp.WinHttpRequest.5.1")
			fetchDevicesIDs.Open("GET", vjoin_DeviceIDs_URL, true)
			fetchDevicesIDs.Send()
		} catch openError {
			throw { what: openError.What, file: A_LineFile, line: openError.Line, message: openError.Message }
			Exit
		} 
		Try {
			fetchDevicesIDs.WaitForResponse()
			Response := fetchDevicesIDs.ResponseText
			Status := fetchDevicesIDs.Status
		} catch responseError {
			throw { what: responseError.What, file: A_LineFile, line: responseError.Line, message: responseError.Message }
			Exit
		}
		if(Status != 200) {
			throw { Error: Status}
			exit
		}
			
		parsedJSON := JSON.load(Response)
		
		For key, val in parsedJson {
			
		}
		
		return parsedJSON
	}
}