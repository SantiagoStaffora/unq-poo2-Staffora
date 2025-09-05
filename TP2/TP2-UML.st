!classDefinition: #EmpresaTest category: #'TP2-UML'!
TestCase subclass: #EmpresaTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!EmpresaTest methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:41:55'!
test01_sueldoBrutoDePepe
	| pepe |
	pepe := Permanente conNombre: 'pepe' hijos: 0 antiguedad: 1.
	pepe estadoCivil: Soltero.
	
	Assert that: pepe calcularBruto isEqualTo: 1050 * peso.! !

!EmpresaTest methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:49:12'!
test02_sueldoNetoDePepito
	| pepito |
	pepito := Permanente conNombre: 'pepito' hijos: 1 antiguedad: 1.
	pepito estadoCivil: Casado.
	
	Assert that: pepito calcularNeto isEqualTo: 955 * peso.! !

!EmpresaTest methodsFor: 'as yet unclassified' stamp: 's.s 9/3/2025 19:08:49'!
test03_calculoTotalSueldosNetos
	| serenisima pepe jorge manuel |
	serenisima := Empresa conNombre: 'serenisima' yCuit: 999.
	pepe := Temporal conNombre: 'pepe' fechaFin: (Date newDay: 14 month: 2 year: 2026) horasExtra: 8.
	jorge := Permanente conNombre: 'jorge' hijos: 2 antiguedad: 5.
	manuel := Permanente  conNombre: 'manuel' hijos: 0 antiguedad: 2.

	pepe fechaNac: (Date newDay: 8 month: 7 year: 1999).
	jorge estadoCivil: Casado.
	manuel estadoCivil: Soltero.

	serenisima listaEmpleados add: pepe.
	serenisima listaEmpleados add: jorge.
	serenisima listaEmpleados add: manuel.
	
	Assert that: serenisima totalSueldosNetos isEqualTo: (pepe calcularNeto) + (jorge calcularNeto) + (manuel calcularNeto )! !

!EmpresaTest methodsFor: 'as yet unclassified' stamp: 's.s 9/3/2025 19:08:27'!
test04_calculoTotalSueldosNetosContratados
	| serenisima pepe jorge manuel |
	serenisima := Empresa conNombre: 'serenisima' yCuit: 999.
	pepe := Temporal conNombre: 'pepe' fechaFin: (Date newDay: 14 month: 2 year: 2026) horasExtra: 8.
	jorge := Permanente conNombre: 'jorge' hijos: 2 antiguedad: 5.
	manuel := Contratado conNombre: 'manuel'.

	pepe fechaNac: (Date newDay: 8 month: 7 year: 1999).
	jorge estadoCivil: Casado.

	serenisima listaEmpleados add: pepe.
	serenisima listaEmpleados add: jorge.
	serenisima listaEmpleados add: manuel.
	
	Assert that: serenisima totalSueldosNetos isEqualTo: (pepe calcularNeto) + (jorge calcularNeto) + (manuel calcularNeto )! !


!classDefinition: #Empleado category: #'TP2-UML'!
Object subclass: #Empleado
	instanceVariableNames: 'nombre direccion estadoCivil fechaNac sueldoBasico'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:25:00'!
calcEdad
	^ (Date today - fechaNac) days // 365.! !

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:55:36'!
calcularBruto
	self subclassResponsibility ! !

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/3/2025 17:51:25'!
calcularNeto
	^ (self calcularBruto) - (self calcularRetenciones)! !

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:54:10'!
calcularRetenciones
	self subclassResponsibility ! !

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 19:59:00'!
direccion
	^ direccion! !

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:19:33'!
direccion: nuevaDireccion
	direccion := nuevaDireccion.! !

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:20:02'!
estadoCivil: estado
	estadoCivil := estado! !

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:20:45'!
fechaNac: fecha
	fechaNac := fecha! !

!Empleado methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:06:16'!
initializeConNombre: nuevoNombre
	nombre := nuevoNombre.
	sueldoBasico := 1000 * peso.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empleado class' category: #'TP2-UML'!
Empleado class
	instanceVariableNames: ''!

!Empleado class methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:02:11'!
conNombre: nombre
	^ self new initializeConNombre: nombre! !


!classDefinition: #Contratado category: #'TP2-UML'!
Empleado subclass: #Contratado
	instanceVariableNames: 'numContrato medioPago'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!Contratado methodsFor: 'as yet unclassified' stamp: 's.s 9/3/2025 17:50:28'!
calcularBruto
	^ sueldoBasico ! !

!Contratado methodsFor: 'as yet unclassified' stamp: 's.s 9/3/2025 17:52:36'!
calcularRetenciones
	^ 50 * peso! !


!classDefinition: #Permanente category: #'TP2-UML'!
Empleado subclass: #Permanente
	instanceVariableNames: 'cantHijos antiguedad'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!Permanente methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:27:29'!
calcularBruto
	^ self salarioFamiliar + sueldoBasico ! !

!Permanente methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:30:23'!
calcularRetenciones
	^ (self calcularBruto * 25 / 100) + (20 * peso) * cantHijos ! !

!Permanente methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:42:26'!
initializeConNombre: Nnombre cantHijos: hijos antiguedad: años
	super initializeConNombre: Nnombre.
	cantHijos := hijos.
	antiguedad := años.
	! !

!Permanente methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:26:34'!
salarioFamiliar
	^ (150 * peso) * cantHijos + (50 * peso) * antiguedad + estadoCivil bono! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Permanente class' category: #'TP2-UML'!
Permanente class
	instanceVariableNames: ''!

!Permanente class methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:53:23'!
conNombre: nombre hijos: hijos antiguedad: años
	^ self new initializeConNombre: nombre cantHijos: hijos antiguedad: años! !


!classDefinition: #Temporal category: #'TP2-UML'!
Empleado subclass: #Temporal
	instanceVariableNames: 'horasExtra fechaFin'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!Temporal methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:54:00'!
calcularBruto
	^ sueldoBasico + (40 * peso) * horasExtra! !

!Temporal methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 18:04:38'!
calcularRetenciones
	^ (self calcularBruto) * 20 / 100 + (RetencionPorEdad new calcularPara: self) + (5 * peso) * horasExtra
	 ! !

!Temporal methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 16:44:43'!
horasExtra: horas
	horasExtra := horas! !

!Temporal methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 22:47:05'!
initializeConNombre: Nnombre fechaFin: fecha horas: cantHoras
	super initializeConNombre: Nnombre.
	fechaFin := fecha.
	horasExtra := cantHoras.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Temporal class' category: #'TP2-UML'!
Temporal class
	instanceVariableNames: ''!

!Temporal class methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 22:49:41'!
conNombre: nombre fechaFin: fecha horasExtra: horas 
	^self new initializeConNombre: nombre fechaFin: fecha horas: horas! !


!classDefinition: #Empresa category: #'TP2-UML'!
Object subclass: #Empresa
	instanceVariableNames: 'nombre cuit listaEmpleados'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!Empresa methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 19:54:15'!
initializeConNombre: nuevoNombre yCuit: nuevoCuit
	nombre := nuevoNombre.
	cuit := nuevoCuit.
	listaEmpleados := Set new.! !

!Empresa methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 19:49:51'!
listaEmpleados
	^ listaEmpleados
! !

!Empresa methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 20:11:43'!
totalRetenciones
	^ listaEmpleados sum: [:empleado | empleado calcularRetenciones ]
				ifEmpty: [0 * peso]! !

!Empresa methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 20:11:25'!
totalSueldosBrutos
	^ listaEmpleados sum: [:empleado | empleado calcularBruto ]
				ifEmpty: [0 * peso]! !

!Empresa methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 20:10:44'!
totalSueldosNetos
	^ listaEmpleados sum: [:empleado | empleado calcularNeto ]
				ifEmpty: [0 * peso]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Empresa class' category: #'TP2-UML'!
Empresa class
	instanceVariableNames: ''!

!Empresa class methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 15:33:43'!
conNombre: nombre yCuit: cuit
	^ self new initializeConNombre: nombre yCuit: cuit.! !


!classDefinition: #ReciboDeHaberes category: #'TP2-UML'!
Empresa subclass: #ReciboDeHaberes
	instanceVariableNames: 'nEmpleado direccion emision sBruto sNeto conceptos'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!ReciboDeHaberes methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 19:58:40'!
initializeParaEmpleado: empleado
	nEmpleado := empleado.
	direccion := empleado direccion.
	emision := Date today.
	sBruto := empleado calcularBruto.
	sNeto := empleado calcularNeto.
	conceptos := 'algo'.! !

!ReciboDeHaberes methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 20:41:04'!
initializeParaLista: lista
	listaEmpleados do: [:empleado | lista add: (self initializeParaEmpleado: empleado)]! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ReciboDeHaberes class' category: #'TP2-UML'!
ReciboDeHaberes class
	instanceVariableNames: ''!

!ReciboDeHaberes class methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 19:56:25'!
paraEmpleado: empleado
	^ self new initializeParaEmpleado: empleado! !

!ReciboDeHaberes class methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 20:36:51'!
paraLista: listaEmpleados
	^ self new initializeParaLista: listaEmpleados! !


!classDefinition: #EstadoCivil category: #'TP2-UML'!
Object subclass: #EstadoCivil
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!EstadoCivil methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:23:05'!
bono
	self subclassResponsibility ! !


!classDefinition: #Casado category: #'TP2-UML'!
EstadoCivil subclass: #Casado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Casado class' category: #'TP2-UML'!
Casado class
	instanceVariableNames: ''!

!Casado class methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:40:44'!
bono
	^ 100 * peso! !


!classDefinition: #Soltero category: #'TP2-UML'!
EstadoCivil subclass: #Soltero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Soltero class' category: #'TP2-UML'!
Soltero class
	instanceVariableNames: ''!

!Soltero class methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 17:40:53'!
bono
	^ 0 * peso
	
	! !


!classDefinition: #RetencionPorEdad category: #'TP2-UML'!
Object subclass: #RetencionPorEdad
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TP2-UML'!

!RetencionPorEdad methodsFor: 'as yet unclassified' stamp: 's.s 9/2/2025 18:06:19'!
calcularPara: empleado
	^ (empleado calcEdad > 50) ifTrue: [ 25 * peso ] ifFalse: [ 0 * peso]! !
