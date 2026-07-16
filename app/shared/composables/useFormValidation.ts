import { toTypedSchema } from '@vee-validate/zod'
import { useForm } from 'vee-validate'
import type { ZodSchema } from 'zod'

export function useFormValidation<T extends Record<string, unknown>>(
  schema: ZodSchema<T>,
) {
  const typedSchema = toTypedSchema(schema)

  const form = useForm<T>({
    validationSchema: typedSchema,
  })

  const { errors, handleSubmit, isSubmitting, values, resetForm, setFieldValue } = form

  return {
    errors,
    handleSubmit,
    isSubmitting,
    values,
    resetForm,
    setFieldValue,
    form,
  }
}