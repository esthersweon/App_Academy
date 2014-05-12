function arrSum(array) {
	if (array.length === 0) {
		return 0
	} else if (array.length === 1) {
		return array[0];
	} else {
		return arrSum(array.splice(1)) + array[0];
	}
}