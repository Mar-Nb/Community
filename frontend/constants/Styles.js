import { Dimensions, StyleSheet } from 'react-native';
import { colors } from './Colors';

export const styles = StyleSheet.create({
  container: {
    height: Dimensions.get('window').height - 65,
    width: Dimensions.get('window').width,
  },
  listScroll: {
    flexDirection: "row",
    flexWrap: "wrap",
    marginTop: 12
  },
  input: {
    width: 200,
    height: 44,
    padding: 10,
    borderWidth: 1,
    borderColor: colors.primary,
    marginBottom: 10,
    backgroundColor: "#FFF"
  },
  inputext: {
    width: 200,
    height: 44,
    padding: 10,
    textAlign: 'center',
    fontWeight: 'bold',
    borderWidth: 1,
    color: colors.primary,
    borderColor: colors.primary,
    marginBottom: 10,
  },
  errorText: {
    width: 200,
    padding: 2,
    fontWeight: 'bold',
    color: "red",
    marginBottom: 10,
  },
  button: {
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: colors.primary,
    width: 200,
    height: 44,
    padding: 10,
    marginBottom: 10,
  },
  roundButton:{
    marginRight: 5,
    marginLeft: 5,
    borderRadius: 5,
    padding: 10,
    backgroundColor: colors.primary,
  }
});

